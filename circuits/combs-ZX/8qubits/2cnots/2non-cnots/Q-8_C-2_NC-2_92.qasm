OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[6], q[1];
z q[7];
x q[4];
cx q[1], q[0];
