cmdkey /delete: "192.168.1.13"
cmdkey /generic:"192.168.1.13" /user:"Elias" /pass:"Pass"

start mstsc /v:"192.168.1.13"
timeout /t 3 /nobreak