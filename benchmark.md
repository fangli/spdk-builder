VMFS volume
============

**Samsung PM1735 NVME**

R: 5000MiB/s
W: 3550MiB/s

```
fio --name=read_throughput --directory=/nvme/ --numjobs=6 --size=20G --time_based --runtime=3600s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --rw=randread --group_reporting=1  --eta-newline=1
fio --name=write_throughput --directory=/nvme/ --numjobs=6 --size=30G --time_based --runtime=3600s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --rw=randwrite --group_reporting=1  --eta-newline=1
```

**SATA RAID6**

R: 2400MiB/s
W: 750MiB/s

```
fio --name=write_throughput --directory=/raid6/ --numjobs=6 --size=30G --time_based --runtime=3600s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --rw=randwrite --group_reporting=1  --eta-newline=1
fio --name=read_throughput --directory=/raid6/ --numjobs=6 --size=20G --time_based --runtime=3600s --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --rw=randread --group_reporting=1  --eta-newline=1
```