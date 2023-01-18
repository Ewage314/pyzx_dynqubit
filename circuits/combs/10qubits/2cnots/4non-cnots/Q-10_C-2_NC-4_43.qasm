OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[6];
x q[4];
x q[7];
x q[1];
x q[2];
cx q[9], q[7];
