# frozen_string_literal: true

# https://github.com/puppetlabs/puppet-specifications/blob/master/language/func-api.md#the-4x-api
Puppet::Functions.create_function(:"puppet_run_offset::run_offset") do
  dispatch :uptime_range do
    param 'Numeric', :a # second range (seconds), typically 1800 seconds. Meaning will trigger in the 1st half of each hour
    param 'Numeric', :b # how often to repeat (hours), typically 24 hours
    param 'Numeric', :c # uptime seconds, put $fact['uptime_seconds']
    param 'Numeric', :d # uptime hours, put $fact['uptime_hours']
    return_type 'Boolean'
  end
  # the function below is called by puppet and and must match
  # the name of the puppet function above. You can set your
  # required parameters below and puppet will enforce these
  # so change x to suit your needs although only one parameter is required
  # as defined in the dispatch method.
  def uptime_range(offset, repeat, uptime_seconds, uptime_hours)
    # check if we match hour offset
    result = uptime_hours.to_f / repeat
    if result.to_i == result
      uptime_hours_sec = uptime_hours * 3600
      result_to_check = uptime_seconds - uptime_hours_sec
      if result_to_check <= offset
        true
      else
        false
      end
    else
      false
    end
  end

  # you can define other helper methods in this code block as well
end
