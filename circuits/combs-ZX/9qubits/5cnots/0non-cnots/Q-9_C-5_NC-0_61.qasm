OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[3];
cx q[4], q[2];
cx q[4], q[7];
cx q[2], q[1];
cx q[6], q[2];
