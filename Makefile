all: executable

executable: convert_to_array.o cuda_density.o cuda_meshestimatortwo.o main.o cudapathestimator.o index.o inner_control_mesh.o cuda_meshweights.o Payoff.o plot_high_bias.o cuda_mesh_generation.o meshOuterControl.o
	nvcc convert_to_array.o cuda_density.o cuda_meshestimatortwo.o main.o cudapathestimator.o index.o inner_control_mesh.o cuda_meshweights.o Payoff.o plot_high_bias.o meshOuterControl.o cuda_mesh_generation.o -arch=sm_35 -o executable 

meshOuterControl.o: meshOuterControl.cpp
	g++ -c meshOuterControl.cpp

main.o: main.cu
	nvcc -c main.cu -arch=sm_35

cuda_mesh_generation.o: cuda_mesh_generation.cu
	nvcc -c cuda_mesh_generation.cu -arch=sm_35 

convert_to_array.o: convert_to_array.cpp
	g++ -c convert_to_array.cpp

cuda_density.o: cuda_density.cpp
	g++ -c cuda_density.cpp

cuda_meshestimatortwo.o: cuda_meshestimatortwo.cu
	nvcc -c cuda_meshestimatortwo.cu -arch=sm_35 

cudapathestimator.o: cudapathestimator.cu
	nvcc -c cudapathestimator.cu -arch=sm_35

index.o: index.cpp
	g++ -c index.cpp

inner_control_mesh.o: inner_control_mesh.cpp
	g++ -c inner_control_mesh.cpp 

Payoff.o: Payoff.cpp
	g++ -c Payoff.cpp 

plot_high_bias.o: plot_high_bias.cpp
	g++ -c plot_high_bias.cpp

cuda_meshweights.o: cuda_meshweights.cpp
	g++ -c cuda_meshweights.cpp 

clean:
	rm -rf *o mesh

