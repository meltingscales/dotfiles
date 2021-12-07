$diskname = 'C:';

$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='$diskname'" | Select-Object Size, FreeSpace

write-host "Size        in  B:  ", $disk.Size
write-host "Free space  in  B:  ", $disk.FreeSpace

write-host "Size        in GB:  ", ((($disk.Size/1000)/1000)/1000)
write-host "Free space  in GB:  ", ((($disk.FreeSpace/1000)/1000)/1000)
