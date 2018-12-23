# Encode/decode Base-64-encoded string

# Encode domain name 'mikefrobbins.com'
[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes("'mikefrobbins.com'"))

# Decode domain name 'mikefrobbins.com'
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String('JwBtAGkAawBlAGYAcgBvAGIAYgBpAG4AcwAuAGMAbwBtACcA'))

# Decode domain name 'mikefrobbins.com'
powershell.exe -NoProfile -EncodedCommand JwBtAGkAawBlAGYAcgBvAGIAYgBpAG4AcwAuAGMAbwBtACcA
