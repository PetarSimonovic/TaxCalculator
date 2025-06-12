# Tax Calculator

Individuals who earn more income pay higher tax rates.

Tax Calculator calculates the total tax payable on an individual's income, taking into account different tax rates across different bands of income.

## Set up

Install dependencies:

```sh
bundle install
```

## Run tests

Use RSpec to run the tests once:

```sh
bundle exec rspec
```

Use Guard to run the tests in watch mode:

```sh
bundle exec guard
```

## Usage

Launch a Ruby REPL, such as `irb`:

```sh
irb -I lib -r tax_calculator
```

`TaxCalculator` is initialized with an array of hashes.

Each hash should contain:

- an `income_threshold`, which defines the upper limit of the tax band;
- and a `rate` that specifies how much tax is paid on that band:

```ruby
bands = [
  { income_threshold: 15600, rate: 10.5 },
  { income_threshold: 53500, rate: 17.5 },
  { income_threshold: 78100, rate: 30 },
  { income_threshold: 180000, rate: 33 },
  { income_threshold: Float::INFINITY, rate: 39 }
]
```

Instantiate the calculator with the bands:

```ruby
calc = TaxCalculator.new(bands)
```

`TaxCalculator` has one method, `calculate`, that accepts an income value and returns the tax payable on it:

```ruby
calc.calculate(600000)
# => 249932.0
```
