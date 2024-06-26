# Alicization

シンセサイズの秘技 «Synthesis Ritual»

## How to deploy

master に push すると GitHub Actions によって自動でデプロイされる

手動でデプロイする場合は

- `pnpm i`
- `pnpm cdktf diff`
- `pnpm cdktf deploy`

Terraform Cloud で実行されるので手元にクレデンシャルは不要

## How to use terraform cli

.env を埋める or AWS CLI でログインしておいて

- `pnpm i`
- `pnpm synth`
- `terraform -chdir=cdktf.out/stacks/stack_name your_command_here`

## License

Copyright 2023 Rokoucha

Released under the Apache License, Version 2.0, see LICENSE.
