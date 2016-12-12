$database = 'Fatima' 
backupDir = 'Backup/'
type = 'restore'

if type == 'backup'
  puts `influxd backup #{backupDir}`
  puts `influxd backup -database #{$database} #{backupDir}`

puts "bckp"

elsif type == 'restore'
	puts `influxd restore -metadir /var/lib/influxdb/meta #{backupDir}`
  puts `influxd restore -database #{$database} -datadir /var/lib/influxdb/data #{backupDir}`
  puts `sudo service influxdb restart`
puts "restore"
