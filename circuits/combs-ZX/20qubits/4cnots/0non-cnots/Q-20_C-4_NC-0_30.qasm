OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[13];
cx q[10], q[6];
cx q[15], q[12];
cx q[19], q[1];
