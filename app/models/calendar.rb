class Calendar < ActiveRecord::Base
  belongs_to :event
  
  def self.get_events(startDate, endDate)
    eventsFormat = [];
    Calendar.all({
      :select     => "calendars.day_of_week, " +
        "calendars.unixtimestamp, " +
        "calendars.minute, " +
        "calendars.hour, " +
        "events.title, " +
        "events.id",
      :joins      => :event, 
      :conditions => (@condition = "FALSE " +
      # Дата проставленна, а день недели не проставлен
      " XOR ((calendars.unixtimestamp BETWEEN #{startDate.to_i} AND #{endDate.to_i}) AND calendars.day_of_week IS NULL)" +
      " XOR ((calendars.unixtimestamp IS NULL) AND (calendars.day_of_week IN (0,1,2,3,4,5,6))) " +
      " ")
    }).each do |event|
      # Если заданна дата но не задан день недели
      if event.day_of_week == nil and event.unixtimestamp != nil
        # Вычисляем точное время
        time = event.unixtimestamp + event.hour * 60 * 60 + event.minute * 60
        # То добавляем эту дату
        eventsFormat.push({
          :id    => event.id,
          :title => event.title,
          :start => Time.at(time).strftime("%Y-%m-%d %H:%M:%S")
        })
      # Если заданн день недели, но не заданна дата
      elsif event.day_of_week != nil and event.unixtimestamp == nil
        i = startDate.to_i
        # то ищем данные дни недели в полученном диапозоне
        while (i < endDate.to_i) do
          # И если находим
          if Time.at(i).strftime("%w") == event.day_of_week.to_s
            # Вычисляем точное время
            time = i + event.hour * 60 * 60 + event.minute * 60
            # То добавляем
            eventsFormat.push({
              :id    => event.id,
              :title => event.title,
              :start => Time.at(time).strftime("%Y-%m-%d %H:%M:%S")
            })
          end
          i += 60 * 60 * 24;
        end
      end
    end
    eventsFormat
  end
end
