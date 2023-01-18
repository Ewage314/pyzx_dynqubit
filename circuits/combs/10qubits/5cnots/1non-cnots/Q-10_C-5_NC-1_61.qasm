OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[9];
cx q[4], q[8];
cx q[7], q[9];
x q[0];
cx q[3], q[9];
cx q[9], q[3];
