# Docker - amule [![Paypal donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/donate/?business=HZF49NM9D35SJ&no_recurring=0&currency_code=CAD)

### Table Of Content
<!-- TOC -->

- [Build](#build)
- [Usage](#usage)
  - [Host Directories and Volume Mapping](#host-directories-and-volume-mapping)
  - [Run](#run)
  - [Compose](#compose)
- [Repository](#repository)
- [Contributors](#contributors)
- [Change Log](#change-log)
- [License](#license)

<!-- /TOC -->

### Build

```sh
git clone https://github.com/J-Siu/docker_amule.git
cd docker_amule
docker build -t jsiu/amule .
```

### Usage

#### Host Directories and Volume Mapping

Host|Inside Container|Mapping Required|Usage
---|---|---|---
${AMULE_DIR}|/amule/.amule/|yes|amule directory
${AMULE_UID}|PUID|yes|amule uid
${AMULE_GID}|PGID|yes|amule gid
${TZ}|P_TZ|yes|time zone

#### Run

```docker
docker run \
-d \
-e PUID=1001 \
-e PGID=1002 \
-e P_TZ=America/New_York \
-v /home/jsiu/.amule:/amule/.amule \
--network=host \
jsiu/amule
```

#### Compose

Get docker-compose template from image:

```docker
docker run --rm jsiu/amule cat /docker-compose.yml > docker-compose.yml
docker run --rm jsiu/amule cat /env > .env
```

Fill in `.env` according to your environment.

```sh
docker-compose up
```

### Repository

- [docker_amule](https://github.com/J-Siu/docker_amule)

### Contributors

- [John Sing Dao Siu](https://github.com/J-Siu)

### Change Log

- 11025
  - amule version 11025-r0
- 11025-r0-p1
  - Add patch postfix `-p1` to indicate container update
  - amule version 11025-r0
  - start.sh
    - Use exec so start.sh can exit
    - Remove delgroup/deluser ${PUSR}
- 11066-r0
  - Auto update to 11066-r0
- 11066-r1
  - Auto update to 11066-r1
- 11066-r2
  - Auto update to 11066-r2
- 2.3.3-r1
  - Auto update to 2.3.3-r1
- 2.3.3-r3
  - Auto update to 2.3.3-r3
- 2.3.3-r3-p1
  - Add docker push github workflow
- 2.3.3-r4
  - Auto update to 2.3.3-r4
- 2.3.3-r5
  - Auto update to 2.3.3-r5
- 2.3.3-r9
  - Auto update to 2.3.3-r9
- 2.3.3-r10
  - Auto update to 2.3.3-r10
- 2.3.3-r13
  - Auto update to 2.3.3-r13
<!--CHANGE-LOG-END-->

### License

The MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
