OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[3];
x q[9];
cx q[5], q[7];
x q[4];
cx q[9], q[8];
cx q[5], q[9];
