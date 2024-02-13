#!/bin/bash

# Absolue path to this script
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Absolute paths to useful directories
ASTRA_SIM_DIR="${SCRIPT_DIR:?}"/../../astra-sim
NS3_DIR="${SCRIPT_DIR:?}"/../../extern/network_backend/ns3

# Inputs - change as necessary.
WORKLOAD="${SCRIPT_DIR:?}"/../../extern/graph_frontend/chakra/one_comm_coll_node_allreduce
SYSTEM="${SCRIPT_DIR:?}"/../../inputs/system/Switch.json
MEMORY="${SCRIPT_DIR:?}"/../../inputs/remote_memory/analytical/no_memory_expansion.json
LOGICAL_TOPOLOGY="${SCRIPT_DIR:?}"/../../inputs/network/ns3/sample_64nodes_1D.json
NETWORK="${SCRIPT_DIR:?}"/../../inputs/network/analytical/Ring_FullyConnected_Switch.yml


echo "WORKLOAD: ${WORKLOAD}"
echo "SYSTEM: ${SYSTEM}"
echo "MEMORY: ${MEMORY}"
echo "LOGICAL_TOPOLOGY: ${LOGICAL_TOPOLOGY}"


./build/astra_analytical/build/bin/AstraSim_Analytical_Congestion_Unaware \
  --workload-configuration=${WORKLOAD} \
  --system-configuration=${SYSTEM} \
  --network-configuration=${NETWORK} \
  --remote-memory-configuration=${MEMORY}