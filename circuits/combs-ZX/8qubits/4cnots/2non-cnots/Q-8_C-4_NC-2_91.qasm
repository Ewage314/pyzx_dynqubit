OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[7];
cx q[6], q[5];
z q[6];
cx q[4], q[1];
cx q[4], q[5];
cx q[7], q[4];
