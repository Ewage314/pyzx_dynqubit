OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[6];
cx q[1], q[2];
x q[5];
x q[6];
x q[6];
cx q[1], q[0];
