OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[7];
x q[8];
cx q[1], q[5];
cx q[5], q[6];
cx q[0], q[7];
cx q[1], q[0];
