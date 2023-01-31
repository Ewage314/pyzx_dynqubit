OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[0];
x q[7];
z q[3];
x q[6];
z q[1];
cx q[5], q[2];
