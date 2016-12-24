package fr.i3s.gciatto.snn2uta.generator

import fr.i3s.gciatto.snn2uta.networkDescriptionLanguage.Neuron
import fr.i3s.gciatto.snn2uta.networkDescriptionLanguage.Synapsis
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtext.generator.IGeneratorContext

package class GeneratorContext implements IGeneratorContext {
	val IGeneratorContext decorated
	val Map<Neuron, List<Synapsis>> neuronsInputs = new HashMap()
	var String name
	var lastId = -1;
	var int granularity;
	var int timeUnit;
	var int timeOffset;
	val Map<String, Integer> idStore = new HashMap()

	new(IGeneratorContext context) {
		decorated = context
	}

	override getCancelIndicator() {
		decorated.cancelIndicator
	}

	def String getName() {
		name
	}

	def setName(String name) {
		this.name = name
	}

	def putSynapsis(Synapsis syn) {
		val dst = syn.destination
		var lst = neuronsInputs.get(dst)

		if (lst == null) {
			lst = new ArrayList()
			neuronsInputs.put(dst, lst)
		}

		lst.add(syn)
	}

	def putSynapses(Iterable<? extends Synapsis> syns) {
		syns.forEach[it.putSynapsis]
	}

	def Iterable<? extends Neuron> getActuallyUsedNeurons() {
		neuronsInputs.keySet
	}

//		def forEachNeuronInputList(BiConsumer<? super Neuron, ? super List<Synapsis>> f) {
//			neuronsInputs.forEach(f)
//		}
	def countInputs(Neuron neuron) {
		val inputs = neuronsInputs.get(neuron)
		if (inputs == null) {
			throw new IllegalArgumentException("No such a neuron: " + neuron.name)
		}
		return inputs.size
	}

	def Iterable<? extends Synapsis> getInputSynapses(Neuron n) {
		neuronsInputs.get(n)
	}

	def getLastId() {
		lastId
	}

	def nextId() {
		lastId += 1
		lastId
	}

	def getGranularity() { granularity }

	def setGranularity(int g) { granularity = g }
	
	def getTimeUnit() { timeUnit }

	def setTimeUnit(int value) { timeUnit = value }
	
	def getTimeOffset() { timeOffset }

	def setTimeOffset(int value) { timeOffset = value }
	
	def storeId(String tag, Integer id) {
		idStore.put(tag, id);
	}
	
	def storeId(String tag) {
		storeId(tag, lastId)
	}
	
	def retrieveId(String tag) {
		idStore.get(tag);
	}
}
