In 1952, Hodgkin and Huxley [1] introduced an electrical circuit model to represent the membrane potential within a neuronal system. 
Grossberg [2] formulated a shunting neurodynamics model based on the dynamics of the membrane. The shunting equation can be expressed as follows 

$$\frac{d \zeta_k}{d t}=-A \zeta_k+\left(B-\zeta_k\right) S_{k}^{e}-\left(D+\zeta_k\right) S_{k}^{i}$$
where $\zeta_k$ denotes the neural activity of the $k$-th neuron; $S^e_k$ and $S^i_k$ represent the excitatory and inhibitory inputs to the neuron, respectively. The parameters of the shunting equation have been discussed in previous works \cite{Li2021bio}. Parameter $A$ is the passive decay rate and the transient response of the external inputs is exclusively determined by the parameter $A$. Parameters $B$ and $D$ are the upper and lower bounds of neural activity, respectively. Under different input conditions, the neural activity $\zeta_k$  will remain in the region $[-D, B]$. In the BINN, the dynamics of the $k$-th neuron in the neural network is characterized by a shunting equation derived from (\ref{eq:shunnting}). The excitatory input $S_{k}^{e}$ results from the target and the lateral connections from its neighboring neurons, while the inhibitory input $S_{k}^{i}$ results from the obstacles only. Therefore, the neural activity of the $k$-th neuron is denoted as follows

$$\frac{d \zeta_k}{d t}=-A\zeta_k+(B-\zeta_k)\Bigg([I_k]^++\sum^n_{l=1}w_{kl}[\zeta_l]^+\Bigg)-(D+\zeta_k)[I_k]^-$$

where $\zeta_l$ denotes the neural activity of neurons neighboring the $k$-th neuron; $n$ signifies the number of these neighboring neurons; $[a]^+$ is defined by $[a]^+=\max \lbrace a,0 \rbrace$; and $[a]^-$ is defined as $[a]^-=\max \lbrace -a,0 \rbrace$.  The connection weight $w_{kl}$ is defined as 

$$
w_{kl}=f(|kl|)=
\begin{cases}
\mu/|kl|, & 0<|kl|\leq r_0 ,\\
0, &|kl|>r_0,
\end{cases}
$$

where $|kl|$ denotes the Euclidean distance between the $k$-th and $l$-th neurons, and $\mu$ is a positive constant, which solely determines the connection weight.  The proposed neural network characterized by the shunting equation guarantees that the positive neural activity can propagate to the whole state space through lateral neural connections, while the negative activity stays locally only since there are no inhibitory connections among neurons. Consequently, the target displays the maximal and positive neural activity that is capable of propagating globally throughout the neural network. On the contrary, obstacles exert exclusively local effects without any propagation. The BINN has been widely used in various autonomous robots [3]. Many complex tasks based on BINN have been studied, such as avoiding collisions with the mobile robot [4], cooperative hunting [5], complete coverage path planning [6], and target search of multiple AUVs [7].
Each neuron is one-to-one representing an environmental location. The neuron receptive field is represented by a circle with a radius of $r_0$ and has lateral connections only to its eight neighboring neurons.  The dynamics of neural activity to the $k$-th neuron within the neural network is delineated by a shunting equation.

[1] A. L. Hodgkin and A. F. Huxley, “A quantitative description of membrane current and its application to conduction and excitation in nerve,” J. Physiol., vol. 117, no. 4, pp. 500–544, Aug. 1952.

[2] S. Grossberg, “Nonlinear neural networks: Principles, mechanisms, and architectures,” Neural Netw., vol. 1, no. 1, pp. 17–61, 1988.

[3] J. Li et al., “Bio-inspired intelligence with applications to robotics: A survey,” Intell. Robot., vol. 1, no. 1, pp. 58–83, Oct. 2021.

[4] S. X. Yang and M.-H. Meng, “Real-time collision-free motion planning of a mobile robot using a neural dynamics-based approach,” IEEE Trans. Neural Netw., vol. 14, no. 6, pp. 1541–1552, Nov. 2003.

[5] J. Ni and S.X.Yang, “Bioinspired neural network for real-time cooperative hunting by multirobots in unknown environments,” IEEE Trans. Neural Netw., vol. 22, no. 12, pp. 2062–2077, Dec. 2011.

[6] C. Luo, S. X. Yang, X. Li, and M. Q.-H. Meng, “Neural-dynamics-driven complete area coverage navigation through cooperation ofmultiple mobile robots,” IEEE Trans. Ind. Electron., vol. 64, no. 1, pp. 750–760, Jan. 2017.

[7] D. Zhu,W. Li,M. Yan, and S. X. Yang, “The path planning of AUV based on DS information fusionmap building and bio-inspired neural network in unknown dynamic environment,” Int. J. Adv. Robotic Syst., vol. 11, no. 3, Jan. 2014, Art. no. 34
