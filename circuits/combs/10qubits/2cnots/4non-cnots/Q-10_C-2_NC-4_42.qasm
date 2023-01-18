OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
x q[0];
x q[0];
cx q[8], q[6];
x q[7];
cx q[3], q[1];
