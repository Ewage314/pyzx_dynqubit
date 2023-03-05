OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[19];
cx q[1], q[9];
x q[2];
cx q[6], q[0];
cx q[11], q[19];
