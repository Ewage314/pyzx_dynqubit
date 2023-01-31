OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[3];
cx q[3], q[0];
x q[3];
cx q[3], q[8];
x q[6];
cx q[9], q[5];
