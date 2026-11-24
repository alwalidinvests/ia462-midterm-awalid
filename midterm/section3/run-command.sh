#!/bin/bash

#!/bin/bash

docker run --rm \
  --name ia462-hardened \
  --read-only \
  --cap-drop ALL \
  --security-opt no-new-privileges:true \
  --security-opt seccomp="$(pwd)/section3/seccomp-profile.json" \
  -e PYTHONDONTWRITEBYTECODE=1 \
  -p 127.0.0.1:5000:5000 \
  ia462-midterm:local
