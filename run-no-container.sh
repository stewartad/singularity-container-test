singularity pull docker://godlovedc/lolcow
echo "hello world" >aaa
./container-structure-test test --driver singularity --container lolcow_latest.sif --config test_config.yaml
rm aaa