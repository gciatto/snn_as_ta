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

### Diamond examples
The `examples/diamond.xml` file is an `Uppaal` system representing a Spiking Neural Network. The network topology is the diamond shown in the following figure:
![The diamond network topology](./.site/img/structure.png)
