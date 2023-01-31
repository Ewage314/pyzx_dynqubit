OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[9], q[0];
z q[1];
cx q[4], q[6];
