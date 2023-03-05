OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[15];
cx q[15], q[4];
cx q[13], q[0];
cx q[15], q[19];
