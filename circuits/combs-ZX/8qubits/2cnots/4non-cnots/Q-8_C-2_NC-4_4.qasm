OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[6];
z q[7];
z q[7];
x q[4];
cx q[3], q[1];
cx q[3], q[7];
