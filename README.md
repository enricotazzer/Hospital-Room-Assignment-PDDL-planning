# Hospital Room Assignment Domain

A PDDL planning domain for hospital room assignment with equipment requirements.

## Prerequisites

### Install Fast Downward

Fast Downward is required to run the planner. Follow the installation instructions:

**Linux/macOS:**

```bash
# Install dependencies
# macOS:
xcode-select --install
brew install cmake

# Linux:
sudo apt install cmake g++ make

# Download and build Fast Downward
git clone https://github.com/aibasel/downward.git fast-downward
cd fast-downward
./build.py
```

For detailed installation instructions, visit: https://www.fast-downward.org/ObtainingAndRunningFastDownward

## Usage

### 1. Create Your Problem Instance

Create a PDDL problem file (e.g., `problem.pddl`) that defines:
- Objects (patients, rooms, equipment)
- Initial state
- Goal state

See the provided example problem files for reference.

### 2. Run the Planner

Execute Fast Downward with the A* search algorithm:

```bash
./fast-downward-24.06.1/fast-downward.py hospital-domain.pddl problem.pddl --search "astar(lmcut())"
```

This will find a plan that achieves the goal state defined in your problem file.

### 3. View the Results

The planner will output:
- The search statistics
- A solution plan (if one exists)
- The plan is saved to `sas_plan` file

## Domain Features

- **Patient Assignment**: Assign patients to rooms with or without equipment
- **Equipment Management**: Handle patients requiring specific medical equipment
- **Patient Movement**: Move patients between rooms
- **Reversible Actions**: Each action has a corresponding reverse action for plan flexibility

## Example

```bash
./fast-downward-24.06.1/fast-downward.py hospital-domain.pddl problem1.pddl --search "astar(lmcut())"
```

## License

This domain is provided for educational and research purposes.
