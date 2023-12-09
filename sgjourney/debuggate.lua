gate = peripheral.find("basic_interface")
methods = peripheral.getMethods("basic_interface_1")
methodsclean = textutils.serialise(methods)

print(methodsclean)