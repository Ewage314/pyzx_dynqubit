OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[14];
cx q[9], q[7];
cx q[19], q[13];
cx q[10], q[8];
