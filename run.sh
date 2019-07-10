echo "they don't think it be like it is, but it do" >aaa

singularity pull docker://godlovedc/lolcow
singularity run singularity_testenv.sif lolcow_latest.sif test_config.yaml