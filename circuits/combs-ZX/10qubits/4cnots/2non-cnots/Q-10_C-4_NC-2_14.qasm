OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[7];
cx q[4], q[5];
x q[3];
cx q[6], q[9];
z q[6];
cx q[3], q[4];
