
	[fmt]: https://doc.rust-lang.org/std/fmt/trait.Display.html#tymethod.fmt
	[fomat]: https://github.com/krdln/fomat-macros
	[handlebars]: https://github.com/sunng87/handlebars-rust
	[horrorshow]: https://github.com/Stebalien/horrorshow-rs
	[markup]: https://github.com/utkarshkukreti/markup.rs
	[maud]: https://github.com/lfairy/maud
	[write]: https://doc.rust-lang.org/std/macro.write.html

	## Results

	As a [violin plot] generated by [Criterion]:

	![Big table violin plot](big-table.svg)
	![Teams violin plot](teams.svg)

	[violin plot]: https://en.wikipedia.org/wiki/Violin_plot
	[criterion]: https://github.com/bheisler/criterion.rs

	Numbers, as output by Criterion:

```java
Big Table
Markup        [171.38 us 171.96 us 172.59 us] 171960 ns
fomat         [182.86 us 184.60 us 186.54 us] 184600 ns
fmt           [194.89 us 196.93 us 198.59 us] 196930 ns
Maud          [219.22 us 220.11 us 221.03 us] 220110 ns
Horrorshow    [258.99 us 261.17 us 263.55 us] 261170 ns
write         [296.53 us 297.37 us 298.21 us] 297370 ns
Handlebars    [25.655 ms 25.836 ms 26.057 ms] 25836000 ns

Teams
fmt               [237.04 ns 238.65 ns 240.04 ns] 238.65 ns
fomat             [276.91 ns 277.99 ns 279.10 ns] 277.99 ns
Maud              [296.81 ns 298.56 ns 300.35 ns] 298.56 ns
Markup            [287.13 ns 305.13 ns 321.33 ns] 305.13 ns
Horrorshow        [405.60 ns 409.08 ns 412.48 ns] 409.08 ns
write             [426.38 ns 429.04 ns 432.11 ns] 429.04 ns
Handlebars        [17.157 us 17.226 us 17.293 us] 17226 ns
```

## Running the benchmarks

	just bench

## For extracting benchmarks to file
	just log file #replace file with the filename you want it extracted to
## To sort benchmarks (Note does not take units into consideration)
	just bigtable # for Big Table Benchmark
	just teams    # for Teams Benchmark
[Just](https://github.com/casey/just) must be installed to use the just commands.

Plots will be rendered if `gnuplot` is installed and will be available in the `target/criterion` folder.
