dir *.csv
echo select a file from the list above.
read findr
(
dd if="$findr" bs=1 count=9
dd if=/dev/zero bs=1 count=4
dd if="$findr" bs=1 skip=9
) | lzma -dc > $findr.decode.csv
exec libreoffice ./$findr.decode.csv
