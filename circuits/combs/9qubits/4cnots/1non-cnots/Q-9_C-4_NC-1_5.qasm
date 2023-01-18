OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[4];
cx q[0], q[1];
x q[0];
cx q[5], q[7];
cx q[8], q[3];
