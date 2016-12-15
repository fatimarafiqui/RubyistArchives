require 'influxdb'
require 'open-uri'
require 'rubygems'
require 'json'
require 'pp'
require "net/http"
require "uri"
require 'time'


username = 'root'
password = 'root'
$database = 'Fatima'
time_precision = 's'
$influxdb = InfluxDB::Client.new $database,
                                username: username,
                                password: password,
                                time_precision: 's'

def insertDB (buildcount)
  data = nil
  data = {values: {value: buildcount},
          timestamp: Time.now.to_i}
  key = 'temp'
  $influxdb.write_point(key, data, $time_precision)
end

def fetchBuild

  temp = rand(300)
  insertDB(temp)
  pp temp

end

def run
  databases = Array.new

  db = $database
  if !databases.include? db
    $influxdb.create_database(db)
  end
  while 1 do
    fetchBuild
    sleep(5)
  end
end
