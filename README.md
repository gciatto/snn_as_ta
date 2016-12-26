Spiking Neural Networks as Timed Automata
=========================================
##### Giovanni CIATTO, Elisabetta DE MARIA, Cinzia DI GIUSTO

Example and generation tool
---------------------------

### Prerequisites
* The `Uppaal` simulator, version `>= 4.1`, is necessary to show, simulate and verify the provided examples. It can be downloaded here: <http://www.it.uu.se/research/group/darts/uppaal/download.shtml>.
* The `Eclipse` IDE with the `Xtext` plugin, may be useful to manipulate the *Network Generator* code. It can be downloaded here: <http://www.eclipse.org/Xtext/download.html>.
* The `Java 8` virtual machine is needed to execute the pre-compiled *Network Generator*. The `JRE` can be download here: <http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html>.

### Outline
* Directory `examples` contains some examples of `Uppaal` systems implementing Spiking Neural Networks as Timed automata, according to our model. Descriptions will follow.
* Directory `network_description_language` contains several `Xtext` projects implementing the *Network Generator* and the respective `Eclipse` plugin. We kindly suggest to manipulate such code by means of the `Eclipse` IDE.
* File `ndl2uppaal.jar` is a Java console application implementing the *Network Generator*. The only requirimenet is `Java 8`.

### Diamond example
The `examples/diamond.xml` file is an `Uppaal` system representing a Spiking Neural Network. The network topology is the diamond shown in the following figure:

![The diamond network topology](./.site/img/structure.png)

where:
* `I` is an *Input Generator*;
* `O` is an *Output Consumer*;
* `N_i` is the `i`-th neuron;
* `y_i` is the *broadcast channel* carrying the output of the `i`-th neuron,
    * `y_0` carryies the output of the input generator;
* `w_i[j]` is the *weight* of the `j`-th input synapse of the `i`-th neuron,
    * if the neuron only has 1 input synapse, the `[j]` index is omitted.

The file contains a *Declarations* section (contining global definitions), a number of *templates* (each defining one *Timed Automaton* structure and behavior) and a *System declarations* section (where template template are instantiated and interconnected).

#### Global *Declarations*
Shared symbols and types are defined in this section.

```c
// Fraction type definition
// as a <num, den> pair
typedef struct {
    int num;
    int den;
} ratio_t;

// Discretization Granularity constant definition
// The [0, 1] real interval is divided into R parts:
// this is how real number are represented
const int R = 100;

// Synaptic weight type definition
// as an integer in the -R ... R interval
typedef int[-R, R] weight_t;

// Synaptic weights definitions
weight_t w1[1] = { R }; // w_1 = 1
weight_t w2[1] = { R / 2 }; // w_2 = 0.5
weight_t w3[1] = { R / 2 }; // w_3 = 0.5
weight_t w4[2] = { R / 4, R / 3}; // w_4[0] = 0.25 and w_4[1] = 0.33

// Output channels definitions
broadcast chan y0;
broadcast chan y1;
broadcast chan y2;
broadcast chan y3;
broadcast chan y4;
```
