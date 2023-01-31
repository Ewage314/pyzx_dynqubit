OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[9];
x q[3];
cx q[5], q[7];
cx q[7], q[9];
z q[4];
cx q[6], q[0];
