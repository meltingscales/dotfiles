while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "processing line: ${LINE}"
done < packages.apt.txt
