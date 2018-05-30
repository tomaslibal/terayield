# terayield

Use Bitcoin price and Bitcoin hashrate data to calculate USD yield of 1 TH/s hashpower. 
The yield does not include fees, only the block reward.

## Usage

```
$> ./get_data_last_365d.sh
(output omitted)
$> octave
octave:1> workbook
```

## More details

The expected data format is price and the hashrate, one numerical value per line in files called `price.csv` and `hashrate.csv`.
The expected length of the data is 365 lines.

The workbook requires the `financial` package to be installed and loaded.
