OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[3];
x q[9];
x q[2];
cx q[9], q[5];
x q[1];
cx q[6], q[7];
