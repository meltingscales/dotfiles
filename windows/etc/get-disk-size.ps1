$diskname = 'C:';

$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='$diskname'" | Select-Object Size, FreeSpace

write-host "Size: ", $disk.Size
write-host "Free space: ", $disk.FreeSpace
