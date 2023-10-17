## Prerequisites

1. Ruby (version > 2.7)
2. Git (version > 2.3 )

## Optimus Grime

Given a grid (where each point on the grid is one square-meter) and a list of points representing square-meters in the office that need to be cleaned, return a list of instructions for getting OptimusGrime to those locations on the grid. An instruction is one of:

> **N**: Move north

> **S**: Move south

> **E**: Move east

> **W**: Move west

> **C**: Clean the square-meter

## Usage
1. Clone the repository:
```bash
  # optionally make a directory for cloning git repositories
  mkdir -p $HOME/kubicle
  cd $HOME/kubicle
  git clone https://github.com/sfahado/optimus-grime
 ```

2. Navigate to the project directory:
 ```bash
 cd $HOME/kubicle
 cd optimus-grime
 ```
### Run the project

3. Run the script with the following command:

> **robot.rb** file is the entry point of the script.

#### valid Arguments
```bash
    ruby ./robot.rb 10 10 1 3 4 4 6 8 1 3 -6 -6 -10 -10 1 3
```
#### Invalid Arguments
```bash
  ruby ./robot.rb 10 10 1 3 4 4 6 8 1 3 -6 -6 -10 -10 1
```
   1. The first two arguments are grid size (e.g., 10 10).
   2. The remaining arguments represent cleaning locations (e.g., 1 3 4 4 6 8 1 3 -6 -6 -10 -100 1).
##### Errors
 - **_Cleaning_locations_** must be valid (ArgumentError)
 - **_Size_** must be valid (ArgumentError)

4. Run the test with the following command:
 ```bash
  cd $HOME/kubicle
  rspec optimus_grime_spec.rb
 ```
Result on console will be something below:
```txt
 Finished in 0.00475 seconds (files took 0.04714 seconds to load)
 7 examples, 0 failures
```

> **_NOTE:_**
OptimusGrime always starts at the origin point, (0, 0). So, first starting point of the Grid is x = 0 and y = 0.


### Additional Information

- The `optimus_grime.rb` script uses command-line arguments to perform based on the provided grid size and cleaning locations.

- The expected input for the grid size is a valid integer array, such as [10, 10].

- The expected arguments should always be valid integer arrays, with even entries at each index of the cleaning locations.

- Ensure that you have Ruby installed on your machine before running the script.

- Please feel free to customize the grid size and cleaning locations, adhering to the specific input format mentioned above..

- If you encounter any issues or have questions, please email **_fahadi.idrees@gmail.com_**

Happy cleaning!
