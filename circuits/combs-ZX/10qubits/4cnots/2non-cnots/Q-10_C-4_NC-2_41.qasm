OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[0];
cx q[1], q[6];
z q[7];
cx q[1], q[3];
x q[2];
cx q[8], q[2];
