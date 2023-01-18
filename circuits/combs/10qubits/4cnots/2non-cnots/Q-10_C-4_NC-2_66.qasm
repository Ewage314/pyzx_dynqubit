OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[7];
cx q[7], q[1];
x q[5];
x q[9];
cx q[1], q[6];
cx q[9], q[3];
