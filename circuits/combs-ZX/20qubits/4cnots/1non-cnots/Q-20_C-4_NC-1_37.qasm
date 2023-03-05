OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[13];
cx q[15], q[1];
cx q[3], q[19];
x q[9];
cx q[16], q[4];
