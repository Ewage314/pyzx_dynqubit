OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
cx q[8], q[6];
cx q[8], q[7];
cx q[5], q[9];
x q[4];
cx q[3], q[2];
