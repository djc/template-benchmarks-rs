#!/usr/bin/env just --justfile


# Runs Cargo Bench
bench:
	cargo bench

# Logs Benchmark Data
log:
	cargo bench | grep time > bench-data.log

# Exports Benchmark Data to File "filename"
export FILE:
	cargo bench | grep time >  {{FILE}}

# Copy Criterion Benchmarks SVGs
svg:
	cp target/criterion/Big\ table/report/violin.svg big-table.svg
	cp target/criterion/Teams/report/violin.svg teams.svg

# Runs Benchmarks & Updates README
update: log svg readme

# Sort Big Table Performance
bigtable:
	cat bench-data.log | grep 'Big table' | sort -n -k 6

# Sort Team Performance
teams:
	cat bench-data.log | grep Teams | sort -n -k 5

# Updates Readme
readme:
	echo '# Templates' > README.md
	echo '' >> README.md
	echo '- [fmt][fmt]: Formats the value using the given formatter.' >> README.md
	echo '- [fomat][fomat]: alternative syntax for print/write/format-like macros with a small templating language' >> README.md
	echo '- [handlebars][handlebars]: Rust templating with Handlebars templating language.' >> README.md
	echo '- [horrorshow][horrorshow]: a templating library written in rust macros' >> README.md
	echo '- [markup][markup]: A blazing fast, type-safe template engine for Rust.' >> README.md
	echo '- [maud][maud]: Compile-time HTML templates for Rust' >> README.md
	echo '- [write!][write]: the std library `write!` macro' >> README.md
	echo '' >> README.md
	echo '[fmt]: https://doc.rust-lang.org/std/fmt/trait.Display.html#tymethod.fmt' >> README.md
	echo '[fomat]: https://github.com/krdln/fomat-macros' >> README.md
	echo '[handlebars]: https://github.com/sunng87/handlebars-rust' >> README.md
	echo '[horrorshow]: https://github.com/Stebalien/horrorshow-rs' >> README.md
	echo '[markup]: https://github.com/utkarshkukreti/markup.rs' >> README.md
	echo '[maud]: https://github.com/lfairy/maud' >> README.md
	echo '[write]: https://doc.rust-lang.org/std/macro.write.html' >> README.md
	echo '' >> README.md
	echo '## Results' >> README.md
	echo '' >> README.md
	echo 'As a [violin plot] generated by [Criterion]:' >> README.md
	echo '' >> README.md
	echo '![Big table violin plot](big-table.svg)' >> README.md
	echo '![Teams violin plot](teams.svg)' >> README.md
	echo '' >> README.md
	echo '[violin plot]: https://en.wikipedia.org/wiki/Violin_plot' >> README.md
	echo '[criterion]: https://github.com/bheisler/criterion.rs' >> README.md
	echo '' >> README.md
	echo 'Numbers, as output by Criterion:' >> README.md
	echo '' >> README.md
	echo '```java' >> README.md
	cat bench-data.log >> README.md
	echo '```' >> README.md
	echo '' >> README.md
	echo '## Running the benchmarks' >> README.md
	echo '' >> README.md
	echo '```sh' >> README.md
	echo 'just bench' >> README.md
	echo '```' >> README.md
	echo '' >> README.md
	echo '## For extracting benchmarks to file' >> README.md
	echo '```sh' >> README.md
	echo 'just log file #replace file with the filename you want it extracted to' >> README.md
	echo '```' >> README.md
	echo '' >> README.md
	echo '## To sort benchmarks (Note does not take units into consideration)' >> README.md
	echo '```shell' >> README.md
	echo 'just bigtable # for Big Table Benchmark' >> README.md
	echo 'just teams    # for Teams Benchmark' >> README.md
	echo '```' >> README.md
	echo 'Plots will be rendered if `gnuplot` is installed and will be available in the `target/criterion` folder.' >> README.md
	echo '[just](https://github.com/casey/just) must be installed to use the just commands.' >> README.md
