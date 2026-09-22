# OmniRoute Wrapper

Wrapper Dockerfile untuk OmniRoute yang fix permission issue pada volume `/data`.

## Masalah yang diperbaiki

OmniRoute image asli (`diegosouzapw/omniroute:latest`) menjalankan app sebagai `node` user (UID 1000), tapi direktori `/data` tidak memiliki permission yang benar. Hasilnya: SQLite database tidak bisa ditulis.

```
Error: EACCES: permission denied, open '/data/storage.sqlite.tmp-...'
```

## Solusi

Dockerfile ini:
1. Base dari `diegosouzapw/omniroute:latest`
2. Switch ke `root` user
3. Ensure `/data` directory owned by `node:node`
4. Switch kembali ke `node` user sebelum app start

## Deploy ke Railway

1. Connect repo ini ke Railway
2. Ubah service source dari `image: diegosouzapw/omniroute:latest` ke repo ini
3. Deploy
4. ✅ App jalan, volume `/data` writable, database OK

## Data persistence

Volume `/data` adalah persistent storage di Railway. Semua data tetap aman walau container restart atau redeploy.

